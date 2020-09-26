# cython: language_level=3
# distutils: language = c++

cdef extern from "backend.hpp":

    ctypedef void (*ApproxCallback)(double, void*, void*)

    void approx_pi_async(unsigned int num_samples,
                         int seed,
                         ApproxCallback callback,
                         void* loop,
                         void* future)
