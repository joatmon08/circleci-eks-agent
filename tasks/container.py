from invoke import task, exceptions
import sys

@task
def build(ctx, image):
    ctx.run('docker build -t {} .'.format(image))

@task
def test(ctx, image):
    container_id = ctx.run(
        'docker run -d -v /var/run/docker.sock:/var/run/docker.sock:ro {} sleep 360'.format(image))
    cid = container_id.stdout
    test_results = ctx.run('inspec exec profiles/circleci_eks_agent -t docker://{}'.format(cid), warn=True)
    ctx.run('docker rm -f {}'.format(cid))
    sys.exit(test_results.exited)