<script setup lang="ts">
import { Alert, AlertDescription, AlertTitle } from '@/components/ui/alert';
import Button from '@/components/ui/button/Button.vue';
import {
    Table,
    TableBody,
    TableCaption,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from '@/components/ui/table/';
import AppLayout from '@/layouts/AppLayout.vue';
import { type BreadcrumbItem } from '@/types';
import { Head, Link, router, usePage } from '@inertiajs/vue3';
import { Check } from 'lucide-vue-next';

interface Product {
    item_id: number;
    kode_barang: string;
    nama_barang: string;
    satuan: string;
    stock_awal: number;
}

interface Props {
    products: Product[];
}

const handleDelete = (item_id: number) => {
    if (confirm('Do you want to delete the product?')) {
        router.delete(`/products/${item_id}`);
    }
};

const props = defineProps<Props>();

const page = usePage();

const breadcrumbs: BreadcrumbItem[] = [
    {
        title: 'Products',
        href: '/products',
    },
];
</script>

<template>
    <Head title="Products" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="p-4">
            <div v-if="$page.props.flash?.message" class="alert">
                <Alert class="mb-6 bg-green-900">
                    <Check />
                    <AlertTitle>Notification!</AlertTitle>
                    <AlertDescription>
                        {{ $page.props.flash.message }}
                    </AlertDescription>
                </Alert>
            </div>
            <Link href="/products/create"><Button>Add Product</Button></Link>
        </div>

        <Table>
            <TableCaption>A list of products.</TableCaption>
            <TableHeader>
                <TableRow>
                    <TableHead> Kode Barang </TableHead>
                    <TableHead>Nama Barang</TableHead>
                    <TableHead>Satuan</TableHead>
                    <TableHead> Stock Awal </TableHead>
                    <TableHead class="text-center"> Action </TableHead>
                </TableRow>
            </TableHeader>
            <TableBody>
                <TableRow
                    v-for="product in props.products"
                    :key="product.item_id"
                >
                    <TableCell class="font-medium">
                        {{ product.kode_barang }}
                    </TableCell>
                    <TableCell>{{ product.nama_barang }}</TableCell>
                    <TableCell>{{ product.satuan }}</TableCell>
                    <TableCell>
                        {{ product.stock_awal }}
                    </TableCell>
                    <TableCell class="space-x-2 text-center">
                        <Link :href="`/products/${product.item_id}/edit`"
                            ><Button class="bg-blue-400">Edit</Button></Link
                        >
                        <Button
                            class="bg-red-400"
                            @click="handleDelete(product.item_id)"
                            >Delete</Button
                        >
                    </TableCell>
                </TableRow>
            </TableBody>
        </Table>
    </AppLayout>
</template>
