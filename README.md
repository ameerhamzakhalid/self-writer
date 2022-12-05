![ci badge](https://github.com/cohere-ai/cohere-python/actions/workflows/test.yaml/badge.svg)
![version badge](https://img.shields.io/pypi/v/cohere)
![license badge](https://img.shields.io/github/license/cohere-ai/cohere-python)

# self-writer

This system provides functionality developed to simplify interfacing with the [Cohere API](https://docs.cohere.ai/) in Python 3.

## Installation

The package can be installed with `pip`:

```bash
pip install --upgrade cohere
```

Install from source:

```bash
python setup.py install
```

### Requirements
- Python 3.6+

## Quick Start

To use this library, you must have an API key and specify it as a string when creating the `cohere.Client` object. API keys can be created through the [platform](https://os.cohere.ai). This is a basic example of the creating the client and using the `generate` endpoint.

```python
import cohere

# initialize the Cohere Client with an API Key
co = cohere.Client('YOUR_API_KEY')

# generate a prediction for a prompt 
prediction = co.generate(
            model='large',
            prompt='co:here',
            max_tokens=10)
            
# print the predicted text          
print('prediction: {}'.format(prediction.generations[0].text))
```

## Versioning
To use the SDK with a specific API version, you can specify it when creating the Cohere Client:

```python
import cohere

co = cohere.Client('YOUR_API_KEY', '2021-11-08')
```




