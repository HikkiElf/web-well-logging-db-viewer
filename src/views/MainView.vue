<script setup>
    import { ref, watch} from 'vue';
    import CustomTable from '../components/CustomTable.vue';
    import CustomButton from '../components/CustomButton.vue';
    import d from "../data/data.json";

    const projectData = ref(d);



</script>

<template>
    <header>
        <h1>"Project name" - "Area name"</h1>
    </header>
    <main>
        <div class="buttons-container">
            <div class="buttons-column">
                <CustomButton>Lorem.</CustomButton>
                <CustomButton>Lorem.</CustomButton>
                <CustomButton>Lorem.</CustomButton>
                <CustomButton>Lorem.</CustomButton>
                <CustomButton>Lorem.</CustomButton>
            </div>
            <div class="buttons-column">
                <CustomButton>Lorem.</CustomButton>
                <CustomButton>Lorem.</CustomButton>
                <CustomButton>Lorem.</CustomButton>
                <CustomButton>Lorem.</CustomButton>
                <CustomButton>Lorem.</CustomButton>
            </div>
        </div>
        <div class="picket-info-container">
            <h1>Picket Data</h1>
            <h2>Picket id: {{ projectData[0].areas[0].pickets[0].id }}</h2>
            <h2>Electric Resistance: {{ projectData[0].areas[0].pickets[0].Measurements.electricResistance }}</h2>
            <h2>Layer density: {{ projectData[0].areas[0].pickets[0].Measurements.layerDensity }}</h2>
            <h2>Gamma ray: {{ projectData[0].areas[0].pickets[0].Measurements.gammaRay }}</h2>
            <h2>Magnetic field: {{ projectData[0].areas[0].pickets[0].Measurements.magneticField }}</h2>
        </div>
        <div class="table-container">
            <CustomTable :data="projectData" />
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
        height: 80dvh;
    }
    .buttons-container {
        display: flex;
        width: 200px;
    }
    .picket-info-container {
        font-size: 30px;
    }

    .table-container {
        overflow-y: auto;
        overflow-x: hidden;
        border: 2px solid white;
        height: 250px;
    }

    
</style>