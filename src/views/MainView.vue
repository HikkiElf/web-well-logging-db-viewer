<script setup>
    // import functions
    import { ref, watch} from 'vue';

    // import components
    import CustomTable from '../components/CustomTable.vue';
    import CustomSelectArea from '../components/CustomSelectArea.vue';
    import CustomSelect from '../components/CustomSelect.vue';

    // import data
    import data from "../data/data.json";

    const allAreas = data[0].areas

    const searchAreaIndex = ref(0);

    const searchProjectIndex = ref(0);

    const selectedPicketId = ref(0);
    const handlePicketId = (id) => {
        selectedPicketId.value = id;
    };
    const showSelectArea = ref(false);
    const selectedProjectName = ref(data[0].project_name); // HARDCODE
    const handleAreaName = (areaName) => {
        selectedAreaName.value = areaName;
        searchAreaIndex.value = allAreas.findIndex((area) => area.area_name === selectedAreaName.value);
        selectedPicketId.value = 0;
    }
    const handleProjectName = (projectName) => {
        selectedProjectName.value = projectName;
        searchProjectIndex.value = data.findIndex((project) => project.project_name === selectedProjectName.value);
        selectedPicketId.value = 0;
        selectedAreaName.value = data[searchProjectIndex.value].areas[0].area_name;
    };
    const selectedAreaName = ref(data[searchProjectIndex.value].areas[0].area_name); // HARDCODE
</script>

<template>
    <header>
        <h1>Select project: </h1>
        <CustomSelect :selectorType="'Select Project'" @getProjectName="handleProjectName"></CustomSelect>
        <h1>Select area:</h1>
        <CustomSelect :selectorType="'Select Area'" @getAreaName="handleAreaName" :selected-project="selectedProjectName"></CustomSelect>
        <!-- <h1>"{{ selectedProjectName }}" - "{{ selectedAreaName }}"</h1> -->
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
            <CustomTable :area-name="selectedAreaName" :project-name="selectedProjectName" @getPicketId = "handlePicketId" />
        </div>
    </main>
    <div>
        <Teleport to="body">
                <CustomSelectArea :show="showSelectArea" @close="showSelectArea = false">
                    <template #header>
                        <h3>Select Area</h3>
                    </template>
                    <template #body>
                        <h3>Custom body</h3>
                    </template>
                </CustomSelectArea>
            </Teleport>
    </div>
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