# Upload to CPAN github action
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
uses: actions/u2c@master
with:
  username: ${{ secrets.USERNAME }}
  password: ${{ secrets.PASSWORD }}
```
