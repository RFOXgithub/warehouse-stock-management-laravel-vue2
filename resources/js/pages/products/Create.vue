<script setup lang="ts">
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
import { Head } from '@inertiajs/vue3';

const breadcrumbs: BreadcrumbItem[] = [
    {
        title: 'Create a Product',
        href: '/products/create',
    },
];
</script>

<template>
    <Head title="Create a Product" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="w-8/12 space-y-4 p-4">
            <Label for="kode-barang">Kode Barang</Label>
            <Input type="text" placeholder="Kode Barang" />
            <Label for="nama-barang">Nama Barang</Label>
            <Input type="text" placeholder="Nama Barang" />
            <Label for="satuan">Satuan</Label>
            <Select>
                <SelectTrigger class="w-[180px]">
                    <SelectValue placeholder="Select a fruit" />
                </SelectTrigger>
                <SelectContent>
                    <SelectGroup>
                        <SelectLabel>Fruits</SelectLabel>
                        <SelectItem value="apple"> Apple </SelectItem>
                        <SelectItem value="banana"> Banana </SelectItem>
                        <SelectItem value="blueberry"> Blueberry </SelectItem>
                        <SelectItem value="grapes"> Grapes </SelectItem>
                        <SelectItem value="pineapple"> Pineapple </SelectItem>
                    </SelectGroup>
                </SelectContent>
            </Select>
            <Label for="stock-awal">Stock Awal</Label>
            <Input type="number" placeholder="Stock Awal" />
        </div>
    </AppLayout>
</template>
