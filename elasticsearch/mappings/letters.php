<?php
class elasticsearch_letters {

    public function mapData(Array $data, Entry $entry) {
        $json = array();
        // var_dump($data);

        $json['_boost'] = 1;

        $json['title'] = $data['title']['value'];
        $json['letter'] = $data['letter']['value'];

        return $json;
    }

}