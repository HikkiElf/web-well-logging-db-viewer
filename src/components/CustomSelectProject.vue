<script setup>
    import { ref, watch, toRef, onMounted } from 'vue';
    import axios, { isCancel, AxiosError} from 'axios';

    const emit = defineEmits(['getProjectName']);

    const responseGetProjects = ref();
    const responceGetProjectName = ref("");
    let allProjects = [];

    onMounted(async () => {
        try {
            responseGetProjects.value = await axios.get('https://well-logging.mrsmori.moe/login?login=Bob&password=123', { withCredentials: true });      
        } catch (error) {
            console.log(error);
            
        }
        responceGetProjectName.value = responseGetProjects.value.data.projects[searchProjectIndex.value].project_name;
        allProjects = JSON.stringify(responseGetProjects.value.data.projects);
        allProjects = JSON.parse(allProjects)
        console.log(allProjects);
    })

    const searchProjectIndex = ref(0);


    const getSelectedProjectName = (projectName) => {
        emit('getProjectName', projectName);
        console.log(allProjects);
        searchProjectIndex.value = responseGetProjects.value.data.projects.findIndex((data) => data.project_name === projectName);
        console.log(searchProjectIndex.value);

        responceGetProjectName.value = responseGetProjects.value.data.projects[searchProjectIndex.value].project_name;
    };


</script>

<template>
    <select name="Select Project" id="select-project" v-model="responceGetProjectName" @change="getSelectedProjectName(responceGetProjectName)">
        <option disabled value="">Select Project</option>
        <option v-for="project in allProjects" :key="project.id" :value="project.project_name">
            {{ project.project_name }}
        </option>
    </select>
</template>


<style>
select {
        --select-bg-color: var(--body-bg-color);

        cursor: pointer;
        appearance: none;
        opacity: 0.6;
        transition: opacity 0.2s;
        /* background-color: var(--select-bg-color); */
    }

    select:hover {
        opacity: 1;
        transition: opacity 0.2s;
    }


    select:required:invalid {
        color: gray;
    }
    option {
        background-color: var(--select-bg-color);
    }
</style>