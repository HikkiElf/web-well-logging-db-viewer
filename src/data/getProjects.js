import axios from "axios";

const responce = ((await axios.get('https://well-logging.mrsmori.moe/login?login=Bob&password=123')));

async function getProjects() {

    // console.log(responce.data.projects[1].id);
    return responce.data.projects[1].id;
}

async function getAreas() {

    const areas = ((await axios.get(`https://well-logging.mrsmori.moe/areas?project_id=${responce.data.projects[0].id}`)));
    console.log(areas.data);
}



export  {getProjects, getAreas};