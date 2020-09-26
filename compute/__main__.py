import asyncio

from compute import approx_pi_async

async def approx_multiple(num_samples, num_threads):

    results = await asyncio.gather(*[approx_pi_async(num_samples, i)
                                     for i in range(num_threads)])

    return sum(results) / num_threads

def main():
    num_samples = 100_000_000
    num_threads = 4

    result = asyncio.run(approx_multiple(num_samples, num_threads))

    print("Approx result: {0}".format(result))


if __name__ == "__main__":
    main()
