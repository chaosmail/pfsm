from distutils.core import setup
from Cython.Build import cythonize

files = ["*"]

setup(name = "pfsm",
    version = "0.1",
    description = "Probabilistic finite state machine in python",
    author = "Christoph Koerner",
    author_email = "office@chaosmail.at",
    url = "http://www.chaosmail.at",
    packages = ['pfsm'],
    ext_modules = cythonize("pfsm/*.py"),
    package_data = {'package' : files }
) 
