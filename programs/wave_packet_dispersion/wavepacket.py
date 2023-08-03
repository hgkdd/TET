import numpy as np
from scipy.special import erf
import matplotlib.pyplot as plt
from matplotlib import animation

c=299792458 # Lichtgeschwindigkeit in m/s
f = np.arange(0, 5e9, 1e6) # all frequencies
r = np.arange(-5,30,0.05) # all positions
t1 = 0 # start time
tstep = .1e-9 # time step in nanoseconds
txt="Time: {time:.2f} ns" # time label

f_center=1e9
f_width=.5e9
vp_center=1e9
vp_width=0.5e9
vp_min=0.74
vp_max=0.76

def vp_from_f (f, min=0.5, max=1.0, center=1e9, width=0.5e9):
    # some s-shaped dispersion curve
    return c*((erf((f-center)/width)+1)*(max-min)*0.5+min)

def k_from_f (f, vp):
    # calculate k from f with specified phase velocity, vp array with phase velecities 
        return 2*np.pi*f / vp     # no dispersion

def gaussian (x, mu, sig):
    # gassian shaped envelope, x: frequencies, mu=center, sig:width
    return np.exp(-np.power(x - mu, 2.) / (2 * np.power(sig, 2.)))

def Psi (r, t, f, k, mu=1e9, sig=500e8, scale=2000):
    # calculate the wave packet, scale: arbitrary scale factor to fit a given y-range
    A=gaussian(f, mu, sig) # weights as a function of frequencies
    om=np.pi*2*f  # omega
    co=np.cos(om*t-k*r)/scale # cosinus
    return np.dot(A,co) # sum usind dot product

vp=vp_from_f (f, min=vp_min, max=vp_max, center=vp_center, width=vp_width) # phase velocyty from frequencies
#vp=np.array([0.75*c for fi in f]) # phase velocyty from frequencies
k1 = k_from_f (f, vp=vp) # wave numbers with dispersion 
#k1 = k_from_f (f, vp=np.array([0.75*c for fi in f])) # wave numbers without dispersion
#k2 = k_from_f (f, vp=np.array([0.75*c for fi in f])) # wave numbers without dispersion 
A = gaussian (f, mu=f_center, sig=f_width)
    
fig, ax = plt.subplots()

ax.set_xlabel("Distance / m")
ax.set_ylabel("Amplitude / a.u.")
ax.set_xlim(-5,30)
ax.set_ylim(-1,1)
ax.grid()

vp_ax = fig.add_axes([.65, .6, .2, .2])
vp_ax.set_xlabel("f / Hz")
vp_ax.set_ylabel("$v_p$ / c")
vp_ax.set_ylim(0.74,0.76)

A_ax = fig.add_axes([.65, .2, .2, .2])
A_ax.set_xlabel("f / Hz")
A_ax.set_ylabel("A / a.u.")

y1 = np.array([Psi(ri, 0, f, k1, mu=f_center, sig=f_width) for ri in r])
y2 = np.array([Psi(ri, 50e-9, f, k1, mu=f_center, sig=f_width) for ri in r])
line1, line2 = ax.plot(r, y1, r, y2)
tmark1=ax.text(-1,-0.5, "0 ns", fontsize=10)
tmark2=ax.text(11,-0.5, "50 ns", fontsize=10)
vp_ax.plot(f, vp/c)
A_ax.plot(f,A)

time_text = ax.text(.2, .6, '', fontsize=10)

def init():
    line1.set_data([], [])
    line2.set_data([], [])
    return line1,

def animate(i):
    y1 = np.array([Psi(ri, t1+i*tstep, f, k1, mu=f_center, sig=f_width) for ri in r])
    #y2 = np.array([Psi(ri, t1+i*tstep, f, k2, mu=f_center, sig=f_width) for ri in r])
    line1.set_data(r, y1)
    #line2.set_data(r, y2)
    time_text.set_text(txt.format(time=i*tstep*1e9))
    return line1, time_text


#anim = animation.FuncAnimation(fig, animate, init_func=init, frames=range(0,1000,1), interval=50, blit=True)
#anim.save("wavepacket-nodisp.mp4", dpi=600, bitrate=6000)


plt.show()
