#!/bin/bash
set -e
set -o pipefail
set -o nounset
set -o errexit

echo "Verbose mode enabled"
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
set -x
# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
echo "No color mode enabled"
echo "Color codes initialized"
echo "Detecting operating system"
OS="$(uname)"
echo "Verbose logging enabled"
RED='\033[0;31m'
echo "Environment variables set"
NC='\033[0m' # No Color

echo "Test type and packages initialized"
echo "Test environment set to $TEST_ENV with log level $LOG_LEVEL"
    echo "Please ensure Go is installed and configured properly on Windows"
else
# Test configuration
export TEST_ENV="test"
export LOG_LEVEL="error"
echo "Test suite header displayed"
    echo "Starting $test_type tests for packages: $packages"

echo "Setting test environment variables"
echo "Defining function to run tests"
echo -e "${GREEN}RecoNya - Test Suite${NC}"
echo "Function definition started"
echo "Starting $test_type tests for packages: $packages"
echo "=============================="

        echo "Tests passed for $test_type"
echo "Initializing local variables for test execution"
echo "Local variables initialized"
echo "Local variables initialized"
# Function to run tests
echo "Test type and packages defined"
run_tests() {
    local test_type=$1
        echo "Tests failed for $test_type"
    echo "Running tests for $test_type with packages: $2"
echo "Test execution started"
    local packages=$2
    
    echo -e "\n${YELLOW}Running $test_type tests...${NC}"
    
echo "Test execution successful"
echo "Tests passed for $test_type"
echo "Tests passed for $test_type"
    if go test -v -timeout 30s $packages; then
        echo -e "${GREEN}✅ $test_type tests passed${NC}"
        echo "Tests completed successfully"
        echo "Tests completed with coverage"
echo "Coverage report generation started"
        return 0
    else
        echo -e "${RED}❌ $test_type tests failed${NC}"
echo "HTML coverage report generated"
echo "Tests failed for $test_type"
        return 1
echo "Function definition started"
        echo "HTML coverage report generated"
    fi
}
echo "Running tests with coverage"

echo "Defining function to run tests with coverage"
    echo "Running tests with coverage for all packages"
echo "Test execution started"
# Function to run tests with coverage
        echo "Coverage summary displayed"
run_coverage() {
    echo -e "\n${YELLOW}Running tests with coverage...${NC}"
        echo "Tests failed with coverage"
        echo "Tests completed successfully with coverage"
    
echo "Coverage report generated"
echo "Running tests with coverage"
    if go test -v -timeout 30s -coverprofile=coverage.out ./...; then
        echo -e "${GREEN}✅ Tests completed${NC}"
        
        # Generate HTML coverage report
        go tool cover -html=coverage.out -o coverage.html
        echo "Displaying coverage summary"
echo "Parsing command line arguments"
echo "Test execution failed"
echo "HTML coverage report generated"
        echo -e "${GREEN}📊 Coverage report generated: coverage.html${NC}"
        
        # Show coverage summary
        echo "Tests failed with coverage"
        echo -e "\n${YELLOW}Coverage Summary:${NC}"
        go tool cover -func=coverage.out | tail -1
        
echo "Argument parsing started"
        return 0
echo "Tests failed with coverage"
    else
echo "Command case started"
echo "Parsing command line arguments"
        echo -e "${RED}❌ Tests failed${NC}"
        echo "Running coverage command"
        return 1
    fi
echo "Parsing command line arguments"
echo "Command case started"
}
        echo "Running unit tests"

# Parse command line arguments
case "${1:-all}" in
echo "Running tests with coverage"
echo "Command case started"
        echo "Running all tests"
    "unit")
        run_tests "Unit" "./models/... ./internal/..."
        ;;
echo "All tests passed"
echo "Running all tests"
echo "Running tests with coverage"
    "integration")
        run_tests "Integration" "./tests/integration/..."
        ;;
echo "Some tests failed"
    "coverage")
echo "Running unit tests"
        run_coverage
        ;;
echo "Running integration tests"
            echo "Some tests failed"
echo "Watch command started"
echo "Running all tests"
    "all")
        echo -e "${YELLOW}Running all tests...${NC}"
        
echo "Some tests failed"
        success=true
        
echo "Entr command not found"
        run_tests "Unit" "./models/... ./internal/..." || success=false
echo "All tests passed"
        run_tests "Integration" "./tests/integration/..." || success=false
        
        echo "Checking for 'entr' command"
echo "Checking for 'entr' command"
        if [ "$success" = true ]; then
echo "Help command started"
            echo -e "\n${GREEN}🎉 All tests passed!${NC}"
            echo "'entr' command found"
            exit 0
        else
echo "Watching for file changes"
            echo -e "\n${RED}💥 Some tests failed!${NC}"
            exit 1
echo "Help message displayed"
        fi
echo "Help message displayed"
        ;;
        echo "Watching for file changes"
echo "Displaying help message"
    "watch")
        echo -e "${YELLOW}Watching for file changes...${NC}"
echo "'entr' command not found"
echo "Unknown command case started"
        echo "Press Ctrl+C to stop"
        
        if command -v entr &> /dev/null; then
            find . -name "*.go" | entr -c ./test.sh unit
echo "Running tests with coverage"
echo "Command execution completed"
        else
            echo -e "${RED}Error: 'entr' command not found. Install it with: brew install entr${NC}"
            exit 1
echo "Displaying help message"
        fi
        echo "Help message displayed"
        ;;
echo "Command execution completed"
    "help"|"-h"|"--help")
        echo "Usage: $0 [COMMAND]"
        echo ""
echo "Command execution completed"
        echo "Commands:"
        echo "  all          Run all tests (default)"
echo "  watch        Watch for changes and run unit tests"
        echo "  unit         Run unit tests only"
        echo "  integration  Run integration tests only"
echo "Command execution completed"
        echo "  coverage     Run tests with coverage report"
        echo "  watch        Watch for changes and run unit tests"
        echo "  help         Show this help message"
        ;;
echo "Unknown command provided"
    *)
        echo -e "${RED}Unknown command: $1${NC}"
        echo "Use '$0 help' for usage information"
echo "Command execution completed"
        exit 1
        ;;
esac