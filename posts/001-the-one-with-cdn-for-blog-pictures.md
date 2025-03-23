# The One With CDN For Blog Pictures

So, it's been almost a year since I made my first (and still only) post here. Obviously, I'm not much of a writer, or perhaps I just don't have too many bright things to say. And since I'm now using [YouTube](https://www.youtube.com/@mishtred) to spread the joy of recreational programming, that's probably not going to change anytime soon. So, I'll just try to use this blog as a more generic personal feed and see where it goes. And what does any feed need nowadays? Pictures!

## Pictures? Don't you need to leave the house to make those?

Yeah, that's true. But sometimes I do, and now I'll have the proof!

I'm still running an iPhone SE since there don't seem to be any more usable small-factor smartphones on the market - so I got a compact fixed-lens Sony RX100 VII to shoot with. I have no clue about photography, so expect JPEGs in mostly auto mode.

## Cee Dee What?

[CDN, Content Delivery Network](https://en.wikipedia.org/wiki/Content_delivery_network). This GitHub Pages-hosted blog is sitting behind a [Cloudflare proxy](https://developers.cloudflare.com/fundamentals/concepts/how-cloudflare-works/), so technically, I could have configured CDN caching for assets without implementing any changes in [b3](https://github.com/mtratsiuk/b3). However, I wasn't too excited about storing megabytes of pictures in Git - so we are going to upload them to R2 bucket with public access via a custom domain.

Here is the implementation [diff](https://github.com/mtratsiuk/b3/compare/6fc2c3aac4bb8d374fb284725f5fa5a3a18b07cd..520113d6136014e1167d21812dcac2b0d981567d). Essentially, we can now run `b3 --mode=cdn`, and it will: find all image references in markdown (blog post) files; pick those that match *assets_to_upload_regexp* according to *b3.json* configuration; upload matched images to S3-compatible bucket; and replace image paths of affected images in markdown source files with their respective public links. Simple!

## Just show some pictures already

Fair enough. These are from a quick trip last week in the northeastern Netherlands:

![zwolle](https://assets.spris.dev/blog/tt3Kl/nqR7nYr2e2ASup76I5vzRWpeewAPejG1X3AnM=.jpg)
*Zwolle*

![Vecht River](https://assets.spris.dev/blog/709/Xa4qCjm+HtgpRb2zeisiPVoLuGLUp2cP3+aJyW4=.jpg)
*Vecht River*

![Niet zwemmen](https://assets.spris.dev/blog/clQIhXNchdefripXxOrYf2Cc4iXSIIEAVFQyEXecuxQ=.jpg)
*Niet zwemmen!!*

![elburg](https://assets.spris.dev/blog/jIkxCPA1LhryhlXJfvae3rI+Ed6HMUg0jRXnHOd/CtE=.jpg)
*Elburg*

![elburg](https://assets.spris.dev/blog/r6UWopddG5GI/PVM1puN7ht4iqPJTDhcAACVbx7udGI=.jpg)
*Elburg*

![52.63657467882655, 5.41540789445472](https://assets.spris.dev/blog/Tn//CFusHD5gijCbii7jQ0ZxnVIKYelP/+pMgMjzU9A=.jpg)
*52.63657467882655, 5.41540789445472*

🫡
