#include "g2log.hpp"

int add(int x, int y)
{
    LOG(DEBUG) << "adding " << x << " to " << y;
    return x + y;
}
