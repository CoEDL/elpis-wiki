
List the images that you have.

    $ docker images

Remove images.

    $ docker image prune -a

You may need to prune containers first, then re-run image prune.

    $ docker container prune

Save image to USB.

    $ docker save alpine > alpine.tar

Load image by name from pwd.

    $ docker load -input alpine.tar

