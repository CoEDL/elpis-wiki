
List the images that you have.

    $ docker images

Remove images.

    $ docker image prune -a

Verify that the images have been removed by doing `docker images` again.


If the images are still there, you may need to remove stopped containers first, then re-run image prune.

    $ docker container prune


Save an image to USB.

    $ docker save alpine > alpine.tar

Load a docker image from disk. First cd to where the image file is, then...

    $ docker load -input alpine.tar

