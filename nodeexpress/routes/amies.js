var express = require('express');
var router = express.Router();
var sqlSelect = require('../data/sqlSelect');
var sqlupdate = require('../data/sqlupdate')

router.get('/list/amies/:id', (req, res) => {

    sqlSelect.get_all_chats(req.params.id, (amies) => {
        return res.json(amies);
    }, (error) => {
        return res.json(error);
    });
});

router.get('/msgs/:ids', (req, res) => {
    const ids = req.params.ids.split('_');
    sqlSelect.get_chat(ids[0], ids[1], (msgs) => {
        msgs['messages'].reverse().every((elem)=>{
            if(elem["lue"] == false){
                elem["lue"]=true;
                return true
            }
            else return false
        });
        msgs['messages'].reverse();
        sqlupdate.updateJson(ids[0], ids[1],msgs);
        return res.json(msgs);
    }, (error) => {
        return res.json(error);
    });
});

router.get('/list_demandes_amie/:ids', (req, res) => {
    sqlSelect.get_demandes_amie(req.params.ids, (msgs) => {
        res.json(msgs);
    }, (error) => {
        res.json(error);
    });
});
  

module.exports = router;