import matplotlib.pyplot as plt
import numpy as np
from numpy import ma
from matplotlib import ticker, cm
from matplotlib import animation
import copy

hin=True
if hin==True:
    fac=1
else:
    fac=-1

N = 1000
x = np.linspace(-1.0, 1.0, N)
y = np.linspace(-1.0, 1.0, N)
levels=[-10+i*0.1 for i in range(201)]

f=1e9
omega=2*np.pi*f
c=299792458
v_p=c
k=fac*omega/v_p
t=0
tstep=.05e-9

X, Y = np.meshgrid(x, y)

r=np.sqrt(X**2+Y**2)
z=1/r*np.cos(omega*t-k*r)

fig, (ax,ax2) = plt.subplots(1,2, figsize=(14, 6))

cmap = copy.copy(cm.get_cmap("OrRd"))
cmap.set_bad(color='white')

xr=np.ma.masked_where(x <0, x)
psi_line=ax2.plot(xr, z[500], color="red")
ax2.plot(xr, 1/r[500], "--", color="blue")
ax2.plot(xr, -1/r[500], "--", color="blue")
ax2.set_ylim(-5, 5)
ax2.set_xlabel("r / m")
ax2.set_ylabel("Amplitude / a.u")
ax2.grid(True)
ax.set_xlabel("x / m")
ax.set_ylabel("y / m")

fig.suptitle('Sperical Wave: $f=1$ GHz, $v_p=c$, Time: {time:.2f} ns'.format(time=0), fontsize=16)

def init():
    global markerline, stemlines, baseline
    psi_line[0].set_data([], [])
    z = 1/r*np.cos(omega*0-k*r)
    cs = ax.contourf(X, Y, z, levels=levels, cmap=cmap, vmin=-10, vmax=10)
    ax.axis('square')
    cbar = fig.colorbar(cs, ax=ax)
    markerline, stemlines, baseline = ax2.stem(xr[1::10], z[500,1::10], 'r-', markerfmt=" ", basefmt=" ")
    return psi_line+cs.collections

def animate(i):
    global markerline, stemlines, baseline
    z = 1/r*np.cos(omega*i*tstep-k*r)
    print (i)
    try:
        for coll in cs.collections:
            coll.remove()
    except:
        None
    ax.clear()
    ax.set_xlabel("x / m")
    ax.set_ylabel("y / m")
    cs = ax.contourf(X, Y, z, levels=levels, cmap=cmap, vmin=-10, vmax=10)
    psi_line[0].set_data(xr, z[500])
    y = z[500,1::10]
    # markerline
    markerline.set_ydata(y)

    # stemlines
    stemlines.set_paths([np.array([[xx, 0], [xx, yy]]) for (xx, yy) in zip(xr, y)])
    markerline, stemlines, baseline = ax2.stem(xr[1::10], y, 'r-', markerfmt=" ", basefmt=" ")
    fig.suptitle('Sperical Wave: $f=1$ GHz, $v_p=c$, Time: {time:.2f} ns'.format(time=i*tstep*1e9), fontsize=16)
    
    return psi_line+cs.collections, markerline, stemlines

plt.tight_layout()
#anim = animation.FuncAnimation(fig, animate, init_func=init, frames=range(0,100,1), interval=50, blit=False)
#anim.save("kugelwelle.mp4", dpi=600, bitrate=6000)

init()
animate(0)
plt.show()
