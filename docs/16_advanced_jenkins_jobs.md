## Advanced Jenkins Jobs
* [jenkins-job-builder](http://docs.openstack.org/infra/jenkins-job-builder/) is a `yaml` based way to configure a [Jenkins](https://jenkins.io/index.html) server
* Having jenkins and jenkins-jobs like [this example](https://github.com/jjasghar/jenkins-jobs/blob/master/minecraft-basic.yml) can help automate validation of the cookbooks and changes from the community
* This can be used to compliment the [Travis](https://travis-ci.org) tests
* You can gate integration tests on public clouds with test-kitchen
