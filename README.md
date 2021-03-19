# Upload to CPAN github action

![](cpan.svg)

**WARNING**: This github action is very young, use at your own risks :grinning:

This action upload your distribution to CPAN

It requires that you generated the dist to have a `My-Distribution-0.01.tar.gz` lying around :grinning:

## Inputs
Set your credentials as github secrets and give them to `with`, they won't be printed during the whole process (they are "secret" after all! :smile:)

### `username`
**Required** The name of the PAUSE account to use.

### `password`
**Required** The password of the PAUSE account to use.

## Example usage
```yml
uses: actions/upload-to-cpan@master
with:
  username: ${{ secrets.USERNAME }}
  password: ${{ secrets.PASSWORD }}
```

For an `ExtUtils::MakeMaker` module, you can then write a `.github/workflows/build-and-action.yml` like this:
```yml
on: [push]

jobs:
  build-and-release:
    runs-on: ubuntu-latest
    name: Build and release to CPAN
    steps:
    - uses: actions/checkout@v2
    - name: Configure
      run: perl Makefile.PL
    - name: Build
      run: make
    - name: Deliver locally
      run: make dist
    - name: Upload to CPAN
      id: upload
      uses: thibaultduponchelle/upload-to-cpan@master
      with:
          username: ${{ secrets.USERNAME }}
          password: ${{ secrets.PASSWORD }}
```

## Details
This github actions is based on [cpan-upload](https://metacpan.org/pod/distribution/CPAN-Uploader/bin/cpan-upload) and will produce this kind of logs if the upload is a success:

```
registering upload with PAUSE web server
POSTing upload for Acme-Automatix-0.02.tar.gz to https://pause.perl.org/pause/authenquery?ACTION=add_uri
PAUSE add message sent ok [200]
```

## Troubleshooting
### Unauthorized
You will get this message if your user/password are not correct:
```bash
registering upload with PAUSE web server
POSTing upload for Acme-Automatix-0.01.tar.gz to https://pause.perl.org/pause/authenquery?ACTION=add_uri
Upload failed (request failed with error code 401
  Message: Unauthorized
), will make attempt #1 ...
```

### Conflict
You will get this message if your distribution already exists with the same version:
```bash
registering upload with PAUSE web server
POSTing upload for Acme-Automatix-0.01.tar.gz to https://pause.perl.org/pause/authenquery?ACTION=add_uri
Upload failed (request failed with error code 409
  Message: Conflict
), will make attempt #1 ...
```
