#include "g2logworker.hpp"
#include "gtest/gtest.h"

int main(int argc, char **argv) {
    auto logworker = g2::LogWorker::createWithDefaultLogger("unittest", ".");
    g2::initializeLogging(logworker.worker.get());

    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
