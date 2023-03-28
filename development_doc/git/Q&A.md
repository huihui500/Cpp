# git
## git Questions

- Q1   
    ```
    使用`git clone https://github.com/huihui500/Cpp.git` error:
    fatal: unable to access 'https://github.com/huihui500/Cpp.git/': Failed to  receive SOCKS4 connect request ack.
    ```
    - 将 `git clone https://github.com/huihui500/Cpp.git`中的`https`更换为`git`。即为`git clone git://github.com/huihui500/Cpp.git`
      - 但是，`git clone git://github.com/huihui500/Cpp.git`之后的仓库不能push;因此推荐用:`git clone git@github.com:{username}/{project}.git`，即`git clone git@github.com:huihui500/Cpp.git`
-   ```

## usage
- push
  - git push <远程主机名> <本地分支名>:<远程分支名>  
