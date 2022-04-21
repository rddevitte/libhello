#include "hello.h"
#include "gtest/gtest.h"

TEST(HelloTest, ShouldPrintHello) {
    ::testing::internal::CaptureStdout();
    hello_print();
    EXPECT_EQ(::testing::internal::GetCapturedStdout(), "hello\n");
}

int main(int argc, char **argv)
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
