# Very basic setup, useful for testing
using DFTK

a = 10.26  # Silicon lattice constant in Bohr
lattice = a / 2 * [[0 1 1.];
                   [1 0 1.];
                   [1 1 0.]]
Si = ElementCoulomb(:Si)
atoms     = [Si, Si]
positions = [ones(3)/8, -ones(3)/8]

temperature = 0.01 # Smearing temperature in Hartree
smearing = DFTK.Smearing.FermiDirac() # Smearing method
model = model_DFT(lattice, atoms, positions; functionals=LDA(), temperature, smearing)
basis = PlaneWaveBasis(model; Ecut=15, kgrid=[4, 4, 4])
scfres = self_consistent_field(basis, tol=1e-8)

println("Done!")
