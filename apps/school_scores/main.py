import tensorflow as tf;
import pandas;

data = pandas.read_csv('scores.csv')

scores_data = data.iloc[:, :-1].values
results_data = data.iloc[:, -1].values

train_scores_data = scores_data[:900000]
train_results_data = results_data[:900000]

test_scores_data = scores_data[900000:]
test_results_data = results_data[900000:]

model = tf.keras.models.Sequential([
  tf.keras.layers.Dense(32, activation='relu', input_shape=(4,)),
  tf.keras.layers.Dense(8),
  tf.keras.layers.Dense(1, activation='sigmoid'),
])

model.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])

history = model.fit(train_scores_data, train_results_data, epochs=2, batch_size=16)

loss, accuracy = model.evaluate(test_scores_data, test_results_data)
print(f'Test loss: {loss:.3f}, Test accuracy: {accuracy:.3f}')

predictions = model.predict([[32940,82438,42462, 100000]])
print(predictions)
