# Upload to CPAN action
This action upload your distribution to CPAN

## Inputs
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
