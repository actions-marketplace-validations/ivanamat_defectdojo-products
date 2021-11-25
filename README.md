# DefectDojo Products ( GitHub Action )

This action creates productos in your DefectDojo dashboard.

# What's new

- Create product

# Usage

See [action.yml](action.yml)

### Upload Report
```yaml
steps:
- name: Create new product
    id: products
    uses: ivanamat/defectdojo-products@v1
    with:
      token: ${{ secrets.DEFECTDOJO_TOKEN }}
      defectdojo_url: ${{ secrets.DEFECTDOJO_URL }}
      defectdojo_endpoint: ${{ secrets.DEFECTDOJO_ENDPOINT }}
      name: "My Project"
      description: "The project description"
      platform: "web"
      prod_type: 1
- name: Show response
  run: |
    set -e
    printf '%s\n' '${{ steps.products.outputs.response }}'
```
### Parameters
There are available the same parameters that are specified in your DefectDojo panel documentation ( https://defectdojo.mydomain.com/api/v2/doc/ ). Don't forget to see [action.yml](action.yml) for more information.

In addition you can provide defectdojo_endpoint where you can specify the products endpoint if is different than /api/v2/products/.

### Outputs

- **response:** This output returns the DefectDojo's API response. Usually, return the import result as a JSON string.

# Limitations
This action has the same limitations as your DefectDojo dashboard API. This action only executes a CURL to your DefectDojo's API products endpoint with the params you have provided.

```bash
curl -v -X POST "$INPUT_DEFECTDOJO_URL$INPUT_DEFECTDOJO_ENDPOINT" -H "Authorization: Token $INPUT_TOKEN" -H "accept: application/json" -H  "Content-Type: multipart/form-data" -F '...'
```
See [entrypoint.sh](entrypoint.sh)

### Additional Documentation

DefectDojo official documentation https://defectdojo.github.io/django-DefectDojo/

# License

The scripts and documentation in this project are released under the [MIT License](LICENSE)
