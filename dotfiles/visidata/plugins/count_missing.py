# count_missing.py - VisiData plugin to count missing values per column

from visidata import Sheet, Column


@Sheet.api
def count_missing_per_column(sheet):
    def count_missing(col):
        return sum(1 for row in sheet.rows if col.getValue(row) in (None, ""))

    # 新しいシートを作って結果を表示
    missing_sheet = Sheet("MissingCounts", source=sheet)
    for col in sheet.visibleCols:
        missing = count_missing(col)
        # missing_sheet.addRow(list([col.name, missing]))

    missing_sheet.addColumn(Column("Column", index=0))
    missing_sheet.addColumn(Column("MissingCount", index=1))
    sheet.source.addSheet(missing_sheet)


# キーバインド（例: `Ctrl+M` で起動）
Sheet.addCommand(None, "count-missing", "count_missing_per_column()")
# Global.bindkey('^O', 'count-missing')
