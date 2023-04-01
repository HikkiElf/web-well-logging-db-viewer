import axios from "axios";


async function getProjects(url) {

    const responce = ((await axios.get('https://well-logging.mrsmori.moe/projects')));
    console.log(responce.data);
    
}

export default getProjects;