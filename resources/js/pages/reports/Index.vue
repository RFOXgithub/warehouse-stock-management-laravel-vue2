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
    jumlah_keluar: number;
    jumlah_masuk: number;
    tanggal_keluar: Date;
    tanggal_masuk: Date;
}

interface Props {
    reports: Product[];
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
                    <TableHead> Product</TableHead>
                    <TableHead>Unit</TableHead>
                    <TableHead> Opening Stock </TableHead>
                    <TableHead> Incoming Stock</TableHead>
                    <TableHead> Outgoing Stock</TableHead>
                    <TableHead> Ending Stock</TableHead>
                </TableRow>
            </TableHeader>
            <TableBody>
                <TableRow
                    v-for="product in props.reports"
                    :key="product.item_id"
                >
                    <TableCell class="font-medium">
                        {{ product.item_id }} - {{ product.kode_barang }} -
                        {{ product.nama_barang }}
                    </TableCell>
                    <TableCell>{{ product.satuan }}</TableCell>
                    <TableCell>{{ product.stock_awal }}</TableCell>
                    <TableCell>
                        {{ product.jumlah_masuk ?? 0 }}
                    </TableCell>
                    <TableCell>
                        {{ product.jumlah_keluar ?? 0 }}
                    </TableCell>
                    <TableCell>
                        {{ product.jumlah_keluar ?? 0 }}
                    </TableCell>
                </TableRow>
            </TableBody>
        </Table>
    </AppLayout>
</template>
