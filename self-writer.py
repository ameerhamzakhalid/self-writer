import cohere 
co = cohere.Client('cWKNSeQXrlaplgl0l9ULMhEt5howqbCkzwbfYX1j') 
response = co.generate( 
  model='5b0775d2-0a86-4463-99ee-b7a591d84a72-ft', 
  prompt='{prompt}', 
  max_tokens=50, 
  temperature=0.9, 
  k=0, 
  p=0.75, 
  frequency_penalty=0, 
  presence_penalty=0, 
  stop_sequences=[], 
  return_likelihoods='NONE') 
print('Prediction: {}'.format(response.generations[0].text)) 
