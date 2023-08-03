### Hans Georg Krauthauser, TU Dresden, Germany, https://www.tu-dresden.de/et/tet
### Licence: CC-BY 3.0 DE
###
import sys
import numpy as np
import matplotlib as mpl
#mpl.use('pgf')
import matplotlib.pyplot as plt
from matplotlib.patches import Circle

x0,y0= 0.25,6
d=10
xmin=-1.0
xmax=1.0

def E_n(n, x, y):
    fac=np.sin(n*np.pi*y0/d)*np.exp(-n*np.pi*np.abs(x-x0))*1.0/n
    fx=fac*np.sin(n*np.pi*y/d)*np.sign(x-x0)
    fy=-fac*np.cos(n*np.pi*y/d)
    return fx,fy
    
def phi_n(n, x, y):
    fac=np.sin(n*np.pi*y0/d)*np.sin(n*np.pi*y/d)*np.exp(-n*np.pi*np.abs(x-x0))*1.0/n
    return fac
    

# Grid of x, y points
nx, ny = 64, 64
x = np.linspace(xmin, xmax, nx)
y = np.linspace(0, d, ny)
X, Y = np.meshgrid(x, y)

phi = np.zeros((ny, nx))
Ex, Ey = np.zeros((ny, nx)), np.zeros((ny, nx))

for n in range(20):
    pn = phi_n(n+1, x=X, y=Y)
    phi += pn
    
for n in range(20):
    enx,eny = E_n(n+1, x=X, y=Y)
    Ex+=enx
    Ey+=eny

fig = plt.figure()
ax = fig.add_subplot(111)

# Plot the streamlines with an appropriate colormap and arrow style
color = 2 * np.log(np.hypot(Ex, Ey))
ax.streamplot(x, y, Ex, Ey, color=color, linewidth=1, cmap=plt.cm.inferno, density=2, arrowstyle='->', arrowsize=1.5)

# plot phi contours
ax.contour(x,y,phi, 100)

ax.set_xlabel('$x$')
ax.set_ylabel('$y$')
ax.set_xlim(xmin,xmax)
ax.set_ylim(0,d)
#ax.set_aspect('equal')
#fig.show()
plt.savefig('plate-wire.png', format='png', dpi=300, transparent=True, bbox_inches='tight')
