#include "g2log.hpp"
#include "g2logworker.hpp"

int main (int argc, char **argv)
{
    auto logworker = g2::LogWorker::createWithDefaultLogger("main", ".");
    g2::initializeLogging(logworker.worker.get());

    LOG(INFO)<< "Application starting";

    LOG(INFO)<< "Application ending";

    return 0;
}
