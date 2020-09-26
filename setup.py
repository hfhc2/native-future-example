from setuptools import Extension, setup
from Cython.Build import cythonize

sources = ['compute/compute.pyx',
           'compute/backend.cpp']

extensions = [Extension("compute.backend",
                        sources,
                        language='c++',
                        include_dirs=['backend'])]


setup(
    name="Compute",
    ext_modules=cythonize(extensions),
)
