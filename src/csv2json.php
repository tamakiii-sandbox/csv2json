<?php

require __DIR__ . '/vendor/autoload.php';

use League\Csv\Reader;

function map(array $array, callable $callback)
{
  return array_map($callback, $array);
}

$csv = Reader::createFromString(file_get_contents('php://stdin'));
$csv->setHeaderOffset(0);

$header = $csv->getHeader();
$records = $csv->getRecords();

$results = map(iterator_to_array($records), function(array $record) use ($header) {
  return array_combine($header, $record);
});

echo json_encode($results);
