###
### This program was adapted from https://scipython.com/blog/visualizing-a-vector-field-with-matplotlib/
### Modifications by Hans Georg Krauthauser, TU Dresden, Germany, https://www.tu-dresden.de/et/tet
### Licence: CC-BY 3.0 DE
###
import sys
import numpy as np
import matplotlib as mpl
#mpl.use('pgf')
import matplotlib.pyplot as plt
from matplotlib.patches import Circle

def E(q, r0, x, y):
    """Return the electric field vector E=(Ex,Ey) due to charge q at r0."""
    den = np.hypot(x-r0[0], y-r0[1])**3
    return q * (x - r0[0]) / den, q * (y - r0[1]) / den

def phi(q, r0, x, y):
    """Return the electric scalar potential phi due to charge q at r0."""
    den = np.hypot(x-r0[0], y-r0[1])
    return q / den

# Create a multipole with nq charges of alternating sign, equally spaced
# on the unit circle.
nq = 2**int(sys.argv[1])
charges = []
for i in range(nq):
    q = i%2 * 3 - 1    # -1, 2, -1, 2, ....
    if i==1:
        q*=2
    charges.append((q, (np.cos(2*np.pi*i/nq), np.sin(2*np.pi*i/nq))))


# x, y ranges
for rge in np.linspace(2, 200, 199):
    xr=rge
    yr=rge

    # Grid of x, y points
    nx, ny = 64, 64
    x = np.linspace(-xr, xr, nx)
    y = np.linspace(-yr, yr, ny)
    X, Y = np.meshgrid(x, y)


    # Electric field vector, E=(Ex, Ey), as separate components
    Ex, Ey = np.zeros((ny, nx)), np.zeros((ny, nx))
    for charge in charges:
        ex, ey = E(*charge, x=X, y=Y)
        Ex += ex
        Ey += ey

    # Scalar potential, phis as scalar
    phis = np.zeros((ny, nx))
    for charge in charges:
        ps = phi(*charge, x=X, y=Y)
        phis += ps
    
    fig = plt.figure()
    ax = fig.add_subplot(111)

    # Plot the streamlines with an appropriate colormap and arrow style
    color = 2 * np.log(np.hypot(Ex, Ey))
    ax.streamplot(x, y, Ex, Ey, color=color, linewidth=1, cmap=plt.cm.inferno, density=2, arrowstyle='->', arrowsize=1.5)

    # plot phi contours
    ax.contour(x,y,phis, 100)

    # Add filled circles for the charges themselves
    charge_colors = {True: '#aa0000', False: '#0000aa'}
    for q, pos in charges:
        ax.add_artist(Circle(pos, 0.05, color=charge_colors[q>0]))

    ax.set_xlabel('$x$')
    ax.set_ylabel('$y$')
    ax.set_xlim(-xr,xr)
    ax.set_ylim(-xr,yr)
    ax.set_aspect('equal')
    #fig.show()
    plt.savefig('multipole-{0:05.0f}.png'.format(xr,yr), format='png', dpi=300, transparent=True, bbox_inches='tight')
