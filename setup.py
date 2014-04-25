from distutils.core import setup

files = ["*"]

setup(name = "pfsm",
    version = "0.1",
    description = "Probabilistic finite state machine in python",
    author = "Christoph Koerner",
    author_email = "office@chaosmail.at",
    url = "http://www.chaosmail.at",
    packages = ['pfsm'],
    package_data = {'package' : files }
)
