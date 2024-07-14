import os


input_file_path = "character_data.csv"
output_file_path = "character_data.dart"

with open(output_file_path, 'w', encoding='utf-8') as fo:
  with open(input_file_path, "r", encoding='utf-8') as fi:
    # 各行に対して処理を行う
    for line in fi:
      cols = line.split(',')
      data = f"""
    Character(
      characterName: '{cols[0]}',
      characterNameRomeji: '{cols[1]}',
      shozoku: '{cols[2]}',
      seiryoku: '{cols[3]}',
      offenseScore: {cols[4]},
      defenseScore: {cols[5]},
      agilityScore: {cols[6]},
      secretArtsName: '{cols[7]}',
      secretArtsDescription: '{cols[8].rstrip('"').lstrip('"')}'
    ),
  """
      fo.write(data)

