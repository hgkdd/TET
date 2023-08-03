import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from matplotlib.patheffects import withStroke

x = np.arange(0, 3.1, 0.1)

def eynorm(x,t):
    return np.exp(-x)*np.cos(2*np.pi*t-x)

def hznorm(x,t):
    return np.exp(-x)*np.cos(2*np.pi*t-x-np.pi/4)


fig, ax = plt.subplots(figsize=(8,6))
ax.set_aspect('equal')

ax.set_ylim([-1,1])
plt.xlabel(r"$x/\delta$")
plt.ylabel(r"$E_y/E_y(x=0)$ bzw. $H_z/H_z(x=0)$")

line_e, line_h, env1, env2= ax.plot(x, eynorm(x,0), 'r-',  x, hznorm(x,0), 'b-', x, np.exp(-x), "k--", x, -np.exp(-x), "k--") 
plt.grid()
line_e.set_label(r'E_y')
line_h.set_label(r'H_z')
env1.set_label(r'Einhüllende')
ax.legend()

#time = ax.annotate(0, xy=(1, 0.5), xytext=(1, 0.5))

r=0.2
clock_e, = ax.plot([1.25, 1.25+r], [0.75, 0.75], 'r-') 
clock_h, = ax.plot([1.25, 1.5+r*np.cos(-np.pi/4)], [0.75, 0.75+r*np.sin(-np.pi/4)], 'b-')
circle = plt.Circle((1.25, 0.75), r, clip_on=False, zorder=10, linewidth=1,
                    edgecolor='black', facecolor=(0, 0, 0, .0125),
                    path_effects=[withStroke(linewidth=5, foreground='w')])
ax.add_patch(circle)

def animate(i):
    line_e.set_ydata(eynorm(x,i/360))  # update the data.
    line_h.set_ydata(hznorm(x,i/360))  # update the data.
    clock_e.set_xdata([1.25, 1.25+r*np.cos(i*2*np.pi/360)])
    clock_e.set_ydata([0.75, 0.75+r*np.sin(i*2*np.pi/360)])
    clock_h.set_xdata([1.25, 1.25+r*np.cos(i*2*np.pi/360-np.pi/4)])
    clock_h.set_ydata([0.75, 0.75+r*np.sin(i*2*np.pi/360-np.pi/4)])
#    time.set_text(r'arg(E_y0) = '+str(i))
    return line_e, line_h, clock_e


ani = animation.FuncAnimation(
    fig, animate, interval=20, blit=False, save_count=360)

# To save the animation, use e.g.
#
ani.save("ey_hz.mp4", dpi=300, bitrate=2500)
#
# or
#
# writer = animation.FFMpegWriter(
#     fps=15, metadata=dict(artist='Me'), bitrate=1800)
# ani.save("movie.mp4", writer=writer)

#plt.show()
