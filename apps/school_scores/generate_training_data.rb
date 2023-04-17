require 'csv'

N1_WEIGHT = 1
N2_WEIGHT = 2
N3_WEIGHT = 3
FINAL_PROJECT_WEIGHT = 4
SAMPLE_SIZE = 1000000
MAX_SCORE = 100000
REQUIRED_AVG = 60000


def generate_scores_data
  data = []
  random = Random.new


  for i in 1..SAMPLE_SIZE do
    n1, n2, n3, final_project = [random.rand(MAX_SCORE), random.rand(MAX_SCORE), random.rand(MAX_SCORE), random.rand(MAX_SCORE)]
    weighted_avg = (N1_WEIGHT * n1) + (N2_WEIGHT * n2) + (N3_WEIGHT * n3) + (final_project * FINAL_PROJECT_WEIGHT)
    weighted_avg = weighted_avg / (N1_WEIGHT + N2_WEIGHT + N3_WEIGHT + FINAL_PROJECT_WEIGHT)

    data << [n1, n2, n3, final_project, weighted_avg >= REQUIRED_AVG]
  end

  data
end

CSV.open('scores.csv', 'wb') do |csv|
  generate_scores_data.each do |row|
    csv << row
  end
end
