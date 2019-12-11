job('Node JS  example'){
    scm{
        git('git://github.com/wardviaene/docker-demo.git') { node -> // is hudson.plugins,git.GItSCM
            node / gitConfigName('Jallen')
            node/ gitConfigEmail('justin.ch@gmail.com')
        }
    }
    triggers{
        scm('H/5 * * * *')
    }
    wrappers{
        nodejs('nodejs') // this is the name of the NodeJS installation in
                         // Manage Jenkins -> Configure tools -> NodeJS Installations -> Name
    }
    steps{
        shell("npm install")
    }
}