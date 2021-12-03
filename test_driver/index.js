var reporter = require('cucumber-html-reporter');

var options = {
        theme: 'bootstrap',
        jsonFile: 'test_driver/reporters/cucumber_report.json',
        output: 'test_driver/reporters/cucumber_report.html',
        reportSuiteAsScenarios: true,
        scenarioTimestamp: true,
        launchReport: true,
        name: "flutter_ddd_skeleton",
        brandTitle: "Integration tests",
        storeScreenshots: true,
        scenarioTimestamp: true,
        metadata: {
            "App Version":"0.3.2",
            "Test Environment": "TESTING",
            "Browser": "Chrome  94.0.4606.54",
            "Platform": "Windows 10",
            "Parallel": "Scenarios",
            "Executed": "Remote",
        }
    };

    reporter.generate(options);


    //more info on `metadata` is available in `options` section below.

    //to generate consodilated report from multi-cucumber JSON files, please use `jsonDir` option instead of `jsonFile`. More info is available in `options` section below.