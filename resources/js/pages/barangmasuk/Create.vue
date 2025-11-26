<script setup lang="ts">
import Button from '@/components/ui/button/Button.vue';
import Input from '@/components/ui/input/Input.vue';
import Label from '@/components/ui/label/Label.vue';
import {
    Select,
    SelectContent,
    SelectGroup,
    SelectItem,
    SelectLabel,
    SelectTrigger,
    SelectValue,
} from '@/components/ui/select';
import AppLayout from '@/layouts/AppLayout.vue';
import { type BreadcrumbItem } from '@/types';
import { Head, useForm } from '@inertiajs/vue3';

const breadcrumbs: BreadcrumbItem[] = [
    {
        title: 'Create a Product',
        href: '/products/create',
    },
];

const props = defineProps({
    newCode: String,
});

const form = useForm({
    kode_barang: props.newCode,
    nama_barang: '',
    satuan: '',
    stock_awal: '',
});

const handleSubmitLog = () => {
    console.log(form);
};

const handleSubmit = () => {
    form.post('/products');
};
</script>

<template>
    <Head title="Create a Barang Masuk" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="p-4">
            <form @submit.prevent="handleSubmit" class="w-8/12 space-y-4">
                <div class="space-y-2">
                    <Label for="kodebarang">Kode Barang</Label>
                    <Input
                        v-model="form.kode_barang"
                        type="text"
                        placeholder="Kode Barang"
                        readonly
                    />
                    <div
                        class="text-sm text-red-600"
                        v-if="form.errors.kode_barang"
                    >
                        {{ form.errors.kode_barang }}
                    </div>
                </div>
                <div class="space-y-2">
                    <Label for="namabarang">Nama Barang</Label>
                    <Input
                        v-model="form.nama_barang"
                        type="text"
                        placeholder="Nama Barang"
                    />
                    <div
                        class="text-sm text-red-600"
                        v-if="form.errors.nama_barang"
                    >
                        {{ form.errors.nama_barang }}
                    </div>
                </div>
                <div class="space-y-2">
                    <Label for="satuan">Satuan</Label>
                    <Select v-model="form.satuan">
                        <SelectTrigger class="w-8/8">
                            <SelectValue placeholder="Satuan" />
                        </SelectTrigger>
                        <SelectContent>
                            <SelectGroup>
                                <SelectLabel>Satuan</SelectLabel>
                                <SelectItem value="pcs"> pcs </SelectItem>
                                <SelectItem value="box"> box </SelectItem>
                                <SelectItem value="kg"> kg </SelectItem>
                                <SelectItem value="unit"> unit </SelectItem>
                                <SelectItem value="set"> set </SelectItem>
                            </SelectGroup>
                        </SelectContent>
                    </Select>
                    <div class="text-sm text-red-600" v-if="form.errors.satuan">
                        {{ form.errors.satuan }}
                    </div>
                </div>
                <div class="space-y-4">
                    <Label for="stockawal">Stock Awal</Label>
                    <Input
                        v-model="form.stock_awal"
                        type="number"
                        min="0"
                        placeholder="Stock Awal"
                    />
                    <div
                        class="text-sm text-red-600"
                        v-if="form.errors.stock_awal"
                    >
                        {{ form.errors.stock_awal }}
                    </div>
                </div>
                <Button
                    class="mt-8 ml-auto block"
                    type="submit"
                    :disabled="form.processing"
                    >Create a Product</Button
                >
            </form>
        </div>
    </AppLayout>
</template>
