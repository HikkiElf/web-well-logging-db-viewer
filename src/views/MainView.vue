<script setup>
    // import functions
    import { ref, watch} from 'vue';

    // import components
    import CustomTable from '../components/CustomTable.vue';
    import CustomSelectArea from '../components/CustomSelectArea.vue';
    import CustomSelectProject from '../components/CustomSelectProject.vue';

    // import data
    import data from "../data/data.json";
    
    const searchAreaIndex = ref(0);
    
    const searchProjectIndex = ref(0);

    const allAreas = ref(data[searchProjectIndex.value].areas)

    const selectedPicketId = ref(0);

    const handlePicketId = (id) => {
        selectedPicketId.value = id;
    };

    const handleAreaName = (areaName) => {
        console.log(allAreas.value);
        allAreas.value = data[searchProjectIndex.value].areas;
        searchAreaIndex.value = allAreas.value.findIndex((area) => area.area_name === areaName);
        selectedPicketId.value = 0;
        console.log(searchProjectIndex.value, searchAreaIndex.value)
        console.log(data[searchProjectIndex.value].areas[searchAreaIndex.value].pickets);
    };

    const handleProjectName = (projectName) => {
        searchProjectIndex.value = data.findIndex((data) => data.project_name === projectName);
        selectedPicketId.value = 0;
        console.log(searchProjectIndex.value, searchAreaIndex.value)
        console.log(data[searchProjectIndex.value].areas[searchAreaIndex.value].pickets);
    };

</script>

<template>
    <header>
        <h1>Select project: </h1>
        <CustomSelectProject @getProjectName="handleProjectName"></CustomSelectProject>
        <h1>Select area:</h1>
        <CustomSelectArea @getAreaName="handleAreaName" :selected-project-index="searchProjectIndex"></CustomSelectArea>
    </header>
    <main>
        <div class="buttons-container">

            <CustomButton>Add picket</CustomButton>
            <CustomButton>Add area</CustomButton>
            <CustomButton>Edit area</CustomButton>
            <CustomButton>Edit data</CustomButton>
            <CustomButton>Edit project</CustomButton>

            <CustomButton>Delete area</CustomButton>
            <CustomButton>Delete picket</CustomButton>
            <CustomButton>Delete project</CustomButton>


        </div>
        <div class="picket-info-container">
            <h1>Picket Data</h1>
            <h2>Picket id: {{ data[searchProjectIndex].areas[searchAreaIndex].pickets[selectedPicketId].id }}</h2>
            <h2>Electric Resistance: {{ data[searchProjectIndex].areas[searchAreaIndex].pickets[selectedPicketId].electric_resistance }}</h2>
            <h2>Layer density: {{ data[searchProjectIndex].areas[searchAreaIndex].pickets[selectedPicketId].layer_density }}</h2>
            <h2>Gamma ray: {{ data[searchProjectIndex].areas[searchAreaIndex].pickets[selectedPicketId].gamma_ray }}</h2>
            <h2>Magnetic field: {{ data[searchProjectIndex].areas[searchAreaIndex].pickets[selectedPicketId].magnetic_field }}</h2>
        </div>
        <div class="table-container">
            <CustomTable :area-search-index="searchAreaIndex" :project-search-index="searchProjectIndex" @getPicketId = "handlePicketId" />
        </div>
    </main>
</template>

<style scoped>
    header {
        display: flex;
        justify-content: space-evenly;
        font-size: 60px;
        margin-bottom: 100px;
        /* border: 2px solid red; */
    }
    main {
        display: inline-flex;
        width: 100%;
        height: 50dvh;
        justify-content: space-around;
        border: 2px solid red;
    }
    .buttons-container {
        display: flex;
        flex-direction: column;
        justify-content: baseline;
        align-items: center;
        width: 280px;
    }
    .buttons-container button {
        width: 150px
    }

    .picket-info-container {
        font-size: 30px;
    }
    .picket-info-container h1 {
        font-weight: bold;
        margin-bottom: 20px;
        font-size: 35px;
    }

    .table-container {
        overflow-y: auto;
        overflow-x: hidden;
        border: 2px solid white;
        height: 59%;
    }

    
</style>