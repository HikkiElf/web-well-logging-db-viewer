<script setup>
    import { ref, watch, toRef, onMounted } from 'vue';
    import axios, { isCancel, AxiosError} from 'axios';

    const emit = defineEmits(['getProjectId']);

    const responseGetProjects = ref();
    let allProjects = [];
    const refAllProjects = ref();
    const selectedProjectName = ref("");
    const selectedProjectId = ref(1);

    onMounted(async () => {
        try {
            responseGetProjects.value = await axios.get('https://well-logging.mrsmori.moe/login?login=Bob&password=123', { withCredentials: true });      
        } catch (error) {
            console.log(error);
            
        }
        refAllProjects.value = JSON.stringify(responseGetProjects.value.data.projects);
        refAllProjects.value = JSON.parse(refAllProjects.value);
    })

    const getSelectedProjectId = (projectName) => {
        selectedProjectId.value = refAllProjects.value.find((project) => project.project_name === projectName).id;
        console.log(selectedProjectId.value, "selectedProjectId in CustomSelectProject");  
        emit('getProjectId', selectedProjectId.value);
    };


</script>

<template>
    <select name="Select Project" id="select-project" v-model="selectedProjectName" @change="getSelectedProjectId(selectedProjectName)">
        <option disabled value="">Select Project</option>
        <option v-for="project in refAllProjects" :key="project.id" :value="project.project_name">
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