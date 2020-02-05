function() {
    var env = karate.env
    if (!env) {
            env = 'sit'
    }
    karate.log("=============================================================")
    karate.log("Scenario Name: " + karate.info.scenarioName)
    karate.log("Feature File Name: " + karate.info.featureFileName)
    karate.log("Environment:  " + env.toUpperCase())
    karate.log("=============================================================")
    var config = {};

    config.stubUrl = "https://microservices-dev.skunkworks-mpv5.org/"

    karate.configure('ssl', true)

    return config;
}