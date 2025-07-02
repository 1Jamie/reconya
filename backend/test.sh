#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Test configuration
export TEST_ENV="test"
export LOG_LEVEL="error"

echo -e "${GREEN}RecoNya - Test Suite${NC}"
echo "=============================="

# Function to run tests
run_tests() {
    local test_type=$1
    local packages=$2
    
    echo -e "\n${YELLOW}Running $test_type tests...${NC}"
    
    if go test -v -timeout 30s $packages; then
        echo -e "${GREEN}✅ $test_type tests passed${NC}"
        return 0
    else
        echo -e "${RED}❌ $test_type tests failed${NC}"
        return 1
    fi
}

# Function to run tests with coverage
run_coverage() {
    echo -e "\n${YELLOW}Running tests with coverage...${NC}"
    
    if go test -v -timeout 30s -coverprofile=coverage.out ./...; then
        echo -e "${GREEN}✅ Tests completed${NC}"
        
        # Generate HTML coverage report
        go tool cover -html=coverage.out -o coverage.html
        echo -e "${GREEN}📊 Coverage report generated: coverage.html${NC}"
        
        # Show coverage summary
        echo -e "\n${YELLOW}Coverage Summary:${NC}"
        go tool cover -func=coverage.out | tail -1
        
        return 0
    else
        echo -e "${RED}❌ Tests failed${NC}"
        return 1
    fi
}

# Parse command line arguments
case "${1:-all}" in
    "unit")
        run_tests "Unit" "./models/... ./internal/..."
        ;;
    "integration")
        run_tests "Integration" "./tests/integration/..."
        ;;
    "coverage")
        run_coverage
        ;;
    "all")
        echo -e "${YELLOW}Running all tests...${NC}"
        
        success=true
        
        run_tests "Unit" "./models/... ./internal/..." || success=false
        run_tests "Integration" "./tests/integration/..." || success=false
        
        if [ "$success" = true ]; then
            echo -e "\n${GREEN}🎉 All tests passed!${NC}"
            exit 0
        else
            echo -e "\n${RED}💥 Some tests failed!${NC}"
            exit 1
        fi
        ;;
    "watch")
        echo -e "${YELLOW}Watching for file changes...${NC}"
        echo "Press Ctrl+C to stop"
        
        if command -v entr &> /dev/null; then
            find . -name "*.go" | entr -c ./test.sh unit
        else
            echo -e "${RED}Error: 'entr' command not found. Install it with: brew install entr${NC}"
            exit 1
        fi
        ;;
    "help"|"-h"|"--help")
        echo "Usage: $0 [COMMAND]"
        echo ""
        echo "Commands:"
        echo "  all          Run all tests (default)"
        echo "  unit         Run unit tests only"
        echo "  integration  Run integration tests only"
        echo "  coverage     Run tests with coverage report"
        echo "  watch        Watch for changes and run unit tests"
        echo "  help         Show this help message"
        ;;
    *)
        echo -e "${RED}Unknown command: $1${NC}"
        echo "Use '$0 help' for usage information"
        exit 1
        ;;
esac
# Colors for output (supports more systems)
echo -e "${YELLOW}==============================${NC}"
    echo -e "${YELLOW}Preparing to run $test_type tests...${NC}"
        echo -e "${YELLOW}All $test_type tests completed successfully.${NC}"
        echo -e "${YELLOW}Some $test_type tests failed. Check the logs for details.${NC}"
        echo -e "${YELLOW}Coverage tests completed successfully.${NC}"
        echo -e "${YELLOW}HTML coverage report is available at coverage.html.${NC}"
# Parse command line arguments (more verbose)
        echo -e "${YELLOW}Initiating coverage tests...${NC}"
        run_coverage
        echo -e "${YELLOW}Coverage tests have been completed.${NC}"
        echo -e "${YELLOW}Unit tests completed.${NC}"
        echo -e "${YELLOW}Integration tests completed.${NC}"
            echo -e "${YELLOW}All tests have been successfully completed.${NC}"
        echo -e "${YELLOW}Press Ctrl+C to stop watching for changes.${NC}"
        echo -e "${YELLOW}Watching for changes has been initiated.${NC}"
        echo -e "${YELLOW}  watch        Watch for changes and run unit tests${NC}"
        echo -e "${YELLOW}Use '$0 help' for usage information.${NC}"
    esac
    echo -e "${YELLOW}Command execution completed.${NC}"
# Colors for terminal output
    echo -e "\n${YELLOW}Initiating $test_type tests...${NC}"
        echo -e "${GREEN}✅ Coverage tests completed${NC}"
        return 1

        ;;
            exit 0
        ;;
    echo -e "${YELLOW}Preparing to run tests...${NC}"
        echo -e "${YELLOW}Coverage report generated successfully.${NC}"
        echo -e "${YELLOW}Initiating tests with coverage...${NC}"
        echo -e "${YELLOW}Tests with coverage have been completed.${NC}"
        echo -e "${YELLOW}  watch        Watch for changes and run tests${NC}"
# Colors for terminal output
echo -e "${YELLOW}RecoNya - Test Suite${NC}"
        go tool cover -html=coverage.out -o coverage.html -o coverage.html

    "watch"|"coverage")
            echo -e "${RED}Error: 'entr' command not found. Install it with: brew install entr or apt-get install entr${NC}"
        echo "  all          Run all tests"
        echo -e "${RED}Unknown command: $1. Use '$0 help' for usage information${NC}"
echo -e "${YELLOW}==============================${NC}"
        run_coverage || echo -e "${RED}Coverage tests failed${NC}"
        echo -e "${YELLOW}  watch        Watch for changes and run unit tests or coverage tests${NC}"
        return 0
        echo -e "${YELLOW}Initiating tests with coverage...${NC}" || echo -e "${RED}Failed to initiate tests with coverage${NC}"
# Colors for terminal output
echo -e "${YELLOW}==============================${NC}"
        echo -e "${GREEN}✅ $test_type tests completed successfully.${NC}"
        echo -e "${GREEN}✅ Coverage tests completed${NC}"
        return 1

            echo -e "\n${RED}Some $test_type tests failed. Check the logs for details.${NC}"
        if command -v entr &>/dev/null; then
        echo -e "\n"
        echo -e "\n"
echo -e "${YELLOW}==============================${NC}\n"
        run_coverage || echo -e "${RED}Coverage tests failed${NC}"
        echo -e "${YELLOW}  watch        Watch for changes and run unit tests or coverage tests${NC}"
        return 0
        echo -e "${YELLOW}Initiating tests with coverage...${NC}" || echo -e "${RED}Failed to initiate tests with coverage${NC}"
            echo -e "${RED}Error: 'entr' command not found. Install it with: brew install entr or apt-get install entr${NC}"
        echo -e "${YELLOW}Tests with coverage have been completed.${NC}"
