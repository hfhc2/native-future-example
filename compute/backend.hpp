#ifndef BACKEND_HPP
#define BACKEND_HPP

typedef void (*ApproxCallback)(double, void*, void*);

void approx_pi_async(unsigned int num_samples,
                     int seed,
                     ApproxCallback callback,
                     void* loop,
                     void* future);

#endif /* BACKEND_HPP */
