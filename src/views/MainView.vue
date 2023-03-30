<script setup>
    import { ref, watch} from 'vue';
    import CustomTable from '../components/CustomTable.vue';
    import d from "../data/data.json";

    const projectData = ref(d);
    const selectedPicketId = ref(0);
    const handlePicketId = (id) => {
        selectedPicketId.value = id;
    };
   
</script>

<template>
    <header>
        <h1>"{{ projectData[0].projectName }}" - "{{ projectData[0].areas[0].areaName }}"</h1>
    </header>
    <main>
        <div class="buttons-container">
            <div class="left-buttons">
                <CustomButton>Select area</CustomButton>
                <CustomButton>Edit area</CustomButton>
                <CustomButton>Add picket</CustomButton>
                <CustomButton>Edit data</CustomButton>
                <CustomButton>Edit project</CustomButton>
            </div>

            <div class="right-buttons">
                <CustomButton>Add area</CustomButton>
                <CustomButton>Delete area</CustomButton>
                <CustomButton>Delete picket</CustomButton>
                <CustomButton>Select project</CustomButton>
                <CustomButton>Delete project</CustomButton>
            </div>

        </div>
        <div class="picket-info-container">
            <h1>Picket Data</h1>
            <h2>Picket id: {{ projectData[0].areas[0].pickets[selectedPicketId].id }}</h2>
            <h2>Electric Resistance: {{ projectData[0].areas[0].pickets[selectedPicketId].Measurements.electricResistance }}</h2>
            <h2>Layer density: {{ projectData[0].areas[0].pickets[selectedPicketId].Measurements.layerDensity }}</h2>
            <h2>Gamma ray: {{ projectData[0].areas[0].pickets[selectedPicketId].Measurements.gammaRay }}</h2>
            <h2>Magnetic field: {{ projectData[0].areas[0].pickets[selectedPicketId].Measurements.magneticField }}</h2>
        </div>
        <div class="table-container">
            <CustomTable :data="projectData" @changePicketId = "handlePicketId" />
        </div>
    </main>
</template>

<style lang="scss" scoped>
    header {
        text-align: center;
        font-size: 60px;
        margin-bottom: 100px;
    }
    main {
        display: flex;
        justify-content: space-around;
    }
    .buttons-container {
        display: flex;
        width: 280px;
    }
    .right-buttons {
        margin-left: 20px;
    }
    .buttons-container button {
        width: 92%;
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
        height: 250px;
    }

    
</style>