-- Source: https://clickhouse.com/docs/get-started/sample-datasets/cell-towers
--
CREATE TABLE IF NOT EXISTS cell_towers 
(
    radio Enum8('' = 0, 'CDMA' = 1, 'GSM' = 2, 'LTE' = 3, 'NR' = 4, 'UMTS' = 5),
    mcc UInt16,
    net UInt16,
    area UInt16,
    cell UInt64,
    unit Int16,
    lon Float64,
    lat Float64,
    range UInt32,
    samples UInt32,
    changeable UInt8,
    created DateTime,
    updated DateTime,
    averageSignal UInt8
)
ENGINE = MergeTree ORDER BY (radio, mcc, net, created);

INSERT INTO cell_towers
SELECT *
FROM s3(
    'https://datasets-documentation.s3.amazonaws.com/cell_towers/cell_towers.csv.xz',
    NOSIGN,
    'CSVWithNames'
);
