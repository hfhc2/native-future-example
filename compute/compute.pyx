# cython: language_level=3
# distutils: language = c++

import asyncio

cimport compute.cbackend

cdef void approx_callback(double result, void* _loop, void* _future) nogil:
    # explicitely acquire the GIL
    with gil:
        loop = (<object> _loop)
        future = (<object> _future)
        loop.call_soon_threadsafe(future.set_result, result)

def approx_pi_async(unsigned int num_samples, int seed):
    loop = asyncio.get_event_loop()
    future = loop.create_future()

    compute.cbackend.approx_pi_async(num_samples,
                             seed,
                             approx_callback,
                             <void*> loop,
                             <void*> future)

    return future
