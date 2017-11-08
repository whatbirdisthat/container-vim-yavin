# YAVIN-IV
## Yavin in a container.

```

____    ____  ___   ____    ____  __  .__   __.         __  ____    ____ 
\   \  /   / /   \  \   \  /   / |  | |  \ |  |        |  | \   \  /   / 
 \   \/   / /  ^  \  \   \/   /  |  | |   \|  |  ______|  |  \   \/   /  
  \_    _/ /  /_\  \  \      /   |  | |  . `  | |______|  |   \      /   
    |  |  /  _____  \  \    /    |  | |  |\   |        |  |    \    /    
    |__| /__/     \__\  \__/     |__| |__| \__|        |__|     \__/     
                                                                         

```

To get this rockin, brew up an `id_rsa` to use for the `yavin` user
to connect to github and get the things:

```bash
	ssh-keygen -t rsa -b 4096 -C "your-email@wherever-man" -f id_rsa
  export ID_RSA=`cat id_rsa`
```

Another way to accomplish awesome is to use pass a little:

```
  export ID_RSA=`pass my/private-key`
```


### It is also quite awesome to get this wired up to your bash.

Add a line in `.bash_profile` or `.bashrc` or like that:

```bash
yavin() {
  docker run -it --rm -v `pwd`:`pwd` -w `pwd` yavin-iv
}
```

Then when you want to get down, type `yavin` in your bash.

To get the nerdtree, hit `\n` and that brings up the "explorer pane" and like that.

### FAQ

*Why do you maintain this YAVIN thing?*

That question is not frequently asked.

