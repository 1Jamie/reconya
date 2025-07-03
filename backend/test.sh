#!/bin/bash
set -e
set -o pipefail

echo "Verbose mode enabled."
set -x
# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
echo "Starting test suite..."
RED='\033[0;31m'
# Detect OS
echo "Detecting operating system..."
OS="$(uname)"
NC='\033[0m' # No Color

echo "Test configuration:"
echo "  TEST_ENV: $TEST_ENV"
echo "  LOG_LEVEL: $LOG_LEVEL"
# Test configuration
export TEST_ENV="test"
export LOG_LEVEL="error"
    echo "Preparing to run $test_type tests for packages: $packages"

echo "Defining function to run tests..."
echo -e "${GREEN}RecoNya - Test Suite${NC}"
    exit 1
echo "=============================="

# Function to run tests
echo "Preparing to run $test_type tests for packages: $packages"
    echo "Running $test_type tests for packages: $packages"
echo "Test type: $test_type, Packages: $packages"
run_tests() {
    local test_type=$1
    local packages=$2
        echo "Tests passed."
    
    echo -e "\n${YELLOW}Running $test_type tests...${NC}"
echo "Starting to run $test_type tests..."
echo "$test_type tests passed."
    echo "Running tests with coverage..."
        echo "Tests failed."
    if go test -v -timeout 30s $packages; then
        echo -e "${GREEN}✅ $test_type tests passed${NC}"
        return 0
        echo "Tests completed successfully."
    else
echo "Running tests with coverage..."

echo "Running tests with coverage..."
        return 1
    fi
        echo "Coverage report generated: coverage.html"
}

        echo "Generating HTML coverage report..."
# Function to run tests with coverage
echo "Tests failed."
echo -e "${RED}❌ $test_type tests failed${NC}"
    echo -e "\n${YELLOW}Running tests with coverage...${NC}"
    
        echo "Displaying coverage summary..."
        echo "Tests failed."
    if go test -v -timeout 30s -coverprofile=coverage.out ./...; then
        echo -e "${GREEN}✅ Tests completed${NC}"
        
        # Generate HTML coverage report
        echo "Integration tests failed."
        go tool cover -html=coverage.out -o coverage.html
echo "Starting coverage tests..."

        
        # Show coverage summary
        echo "Running unit tests..."
        echo -e "\n${YELLOW}Coverage Summary:${NC}"
        go tool cover -func=coverage.out | tail -1
echo "Integration tests completed."
        
        return 0

        echo "Integration tests completed."
    echo "Parsing command line arguments..."
        echo -e "${RED}❌ Tests failed${NC}"
        return 1
        echo "Running tests with coverage..."
    fi
}
echo "Integration tests completed."
        echo "Running integration tests..."
echo -e "${RED}❌ Tests failed${NC}"
# Parse command line arguments
case "${1:-all}" in
        echo "Running all tests..."
    "unit")
            echo "Exiting with status 0."
        run_tests "Unit" "./models/... ./internal/..."
        ;;
    "integration")
        run_tests "Integration" "./tests/integration/..."
echo "Running all tests..."
        echo "Running coverage tests..."
    "coverage")
        run_coverage
            echo "Exiting with status 0."
        ;;
    "all")
        echo "Checking if all tests passed..."
        echo -e "${YELLOW}Running all tests...${NC}"
        
        success=true
echo "Running coverage tests..."
run_coverage
    "watch")
            echo "Some tests failed."
        run_tests "Unit" "./models/... ./internal/..." || success=false
        run_tests "Integration" "./tests/integration/..." || success=false
        
        if [ "$success" = true ]; then
        echo "Watching for file changes..."
echo "Checking if all tests passed..."
if [ "$success" = true ]; then
            exit 0
            echo "Checking for 'entr' command..."
        else
            echo -e "\n${RED}💥 Some tests failed!${NC}"
        echo "Checking for 'entr' command..."
            exit 1
        fi
        ;;
    "watch")
echo "Watching for file changes..."
            echo "Error: 'entr' command not found."
;;
        echo "Press Ctrl+C to stop"
        echo "Available commands:"
        
        if command -v entr &> /dev/null; then
        echo "Displaying help message..."
            find . -name "*.go" | entr -c ./test.sh unit
        else
            echo -e "${RED}Error: 'entr' command not found. Install it with: brew install entr${NC}"
            exit 1
echo "Checking for 'entr' command..."
        echo "  all          Run all tests (default)"
echo -e "${RED}Error: 'entr' command not found. Install it with: brew install entr${NC}"
        ;;
    *)
    "help"|"-h"|"--help")
        echo "Usage: $0 [COMMAND]"
        echo "  help         Show this help message"
        echo ""
        echo "Commands:"
        echo "  all          Run all tests (default)"
echo "Commands:"
        echo "  integration  Run integration tests only"
        echo "Unknown command."
set +x
        echo "  coverage     Run tests with coverage report"
        echo "  watch        Watch for changes and run unit tests"
echo "Exiting with unknown command error."
        echo "  help         Show this help message"
echo "  watch        Watch for changes and run unit tests"
echo "  help         Show this help message"
    *)
        echo -e "${RED}Unknown command: $1${NC}"
        echo "Use '$0 help' for usage information"
        exit 1
        ;;
esac
echo -e "${RED}Unknown command: $1${NC}"