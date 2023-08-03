import numpy as np
import matplotlib.pyplot as plt

mu=mu0=4*np.pi*1e-7
kappa_cu = 58e6
kappa_al = 38e6
kappa_sea = 5
params = [(kappa_cu, 1, 'Kupfer'), (kappa_al, 1, "Aluminium"), (kappa_sea, 1, "Seewasser")]

f = np.logspace(1, 10, num=1000)

def depth(f, mur=1, kappa=kappa_cu):
    mu=mu0*mur
    om=2*np.pi*f
    return np.sqrt(2/(om*mu*kappa))


fig, ax = plt.subplots(figsize=(8,6))
#ax.set_aspect('equal')
ax.grid()

legtemplate='{0}: κ={1:.2e} S/m'
for k,m,t in params:
    ax.loglog(f, depth(f, mur=m, kappa=k), label=legtemplate.format(t,k))
    
plt.legend()    

ax.set_xticks([50,1e3,1e6,1e9])
ax.set_xticklabels(['50','1k','1M','1G'])
ax.set_xlabel('Frequenz / Hz')
ax.set_yticks([1e-6,1e-3,1,1e3])
ax.set_yticklabels([r'1µ','1m','1','1k'])
ax.set_ylabel('Eindringtiefe / m')

#plt.show()
plt.savefig('skin_depth.pdf', format='pdf', transparent=True, bbox_inches='tight')
